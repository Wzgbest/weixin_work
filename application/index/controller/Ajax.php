<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use fast\Random;
use think\Config;
use think\Lang;

/**
 * Ajax异步请求接口
 * @internal
 */
class Ajax extends Base
{

    protected $noNeedLogin = ['lang'];
    protected $noNeedRight = ['*'];
    protected $layout = '';

    /**
     * 加载语言包
     */
    public function lang()
    {
        header('Content-Type: application/javascript');
        $callback = $this->request->get('callback');
        $controllername = input("controllername");
        $this->loadlang($controllername);
        //强制输出JSON Object
        $result = 'define(' . json_encode(Lang::get(), JSON_FORCE_OBJECT | JSON_UNESCAPED_UNICODE) . ');';
        return $result;
    }

    /**
     * 上传文件
     */
    public function upload()
    {
        Config::set('default_return_type', 'json');
        $file = $this->request->file('file');
        if (empty($file))
        {
            $this->error(__('No file upload or server upload limit exceeded'));
        }

        //判断是否已经存在附件
        $sha1 = $file->hash();

        $upload = Config::get('upload');

        preg_match('/(\d+)(\w+)/', $upload['maxsize'], $matches);
        $type = strtolower($matches[2]);
        $typeDict = ['b' => 0, 'k' => 1, 'kb' => 1, 'm' => 2, 'mb' => 2, 'gb' => 3, 'g' => 3];
        $size = (int) $upload['maxsize'] * pow(1024, isset($typeDict[$type]) ? $typeDict[$type] : 0);
        $fileInfo = $file->getInfo();
        $suffix = strtolower(pathinfo($fileInfo['name'], PATHINFO_EXTENSION));
        $suffix = $suffix ? $suffix : 'file';

        $mimetypeArr = explode(',', $upload['mimetype']);
        $typeArr = explode('/', $fileInfo['type']);
        //验证文件后缀
        if ($upload['mimetype'] !== '*' && !in_array($suffix, $mimetypeArr) && !in_array($fileInfo['type'], $mimetypeArr) && !in_array($typeArr[0] . '/*', $mimetypeArr))
        {
            $this->error(__('Uploaded file format is limited'));
        }
        $replaceArr = [
            '{year}'     => date("Y"),
            '{mon}'      => date("m"),
            '{day}'      => date("d"),
            '{hour}'     => date("H"),
            '{min}'      => date("i"),
            '{sec}'      => date("s"),
            '{random}'   => Random::alnum(16),
            '{random32}' => Random::alnum(32),
            '{filename}' => $suffix ? substr($fileInfo['name'], 0, strripos($fileInfo['name'], '.')) : $fileInfo['name'],
            '{suffix}'   => $suffix,
            '{.suffix}'  => $suffix ? '.' . $suffix : '',
            '{filemd5}'  => md5_file($fileInfo['tmp_name']),
        ];
        $savekey = $upload['savekey'];
        $savekey = str_replace(array_keys($replaceArr), array_values($replaceArr), $savekey);

        $uploadDir = substr($savekey, 0, strripos($savekey, '/') + 1);
        $fileName = substr($savekey, strripos($savekey, '/') + 1);
        //
        $splInfo = $file->validate(['size' => $size])->move(ROOT_PATH . '/public' . $uploadDir, $fileName);
        if ($splInfo)
        {
            $imagewidth = $imageheight = 0;
            if (in_array($suffix, ['gif', 'jpg', 'jpeg', 'bmp', 'png', 'swf']))
            {
                $imgInfo = getimagesize($splInfo->getPathname());
                $imagewidth = isset($imgInfo[0]) ? $imgInfo[0] : $imagewidth;
                $imageheight = isset($imgInfo[1]) ? $imgInfo[1] : $imageheight;
            }
            $params = array(
                'filesize'    => $fileInfo['size'],
                'imagewidth'  => $imagewidth,
                'imageheight' => $imageheight,
                'imagetype'   => $suffix,
                'imageframes' => 0,
                'mimetype'    => $fileInfo['type'],
                'url'         => $uploadDir . $splInfo->getSaveName(),
                'uploadtime'  => time(),
                'storage'     => 'local',
                'sha1'        => $sha1,
            );
            $attachment = model("attachment");
            $attachment->data(array_filter($params));
            $attachment->save();
            \think\Hook::listen("upload_after", $attachment);
            $this->success(__('Upload successful'), null, [
                'url' => $uploadDir . $splInfo->getSaveName()
            ]);
        }
        else
        {
            // 上传失败获取错误信息
            $this->error($file->getError());
        }
    }

}
