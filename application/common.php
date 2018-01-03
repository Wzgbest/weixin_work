<?php

// 公共助手函数

if (!function_exists('__'))
{

    /**
     * 获取语言变量值
     * @param string    $name 语言变量名
     * @param array     $vars 动态变量值
     * @param string    $lang 语言
     * @return mixed
     */
    function __($name, $vars = [], $lang = '')
    {
        if (is_numeric($name) || !$name)
            return $name;
        if (!is_array($vars))
        {
            $vars = func_get_args();
            array_shift($vars);
            $lang = '';
        }
        return think\Lang::get($name, $vars, $lang);
    }

}

if (!function_exists('format_bytes'))
{

    /**
     * 将字节转换为可读文本
     * @param int $size 大小
     * @param string $delimiter 分隔符
     * @return string
     */
    function format_bytes($size, $delimiter = '')
    {
        $units = array('B', 'KB', 'MB', 'GB', 'TB', 'PB');
        for ($i = 0; $size >= 1024 && $i < 6; $i++)
            $size /= 1024;
        return round($size, 2) . $delimiter . $units[$i];
    }

}

if (!function_exists('datetime'))
{

    /**
     * 将时间戳转换为日期时间
     * @param int $time 时间戳
     * @param string $format 日期时间格式
     * @return string
     */
    function datetime($time, $format = 'Y-m-d H:i:s')
    {
        $time = is_numeric($time) ? $time : strtotime($time);
        return date($format, $time);
    }

}

if (!function_exists('human_date'))
{

    /**
     * 获取语义化时间
     * @param int $time 时间
     * @param int $local 本地时间
     * @return string
     */
    function human_date($time, $local = null)
    {
        return \fast\Date::human($time, $local);
    }

}

if (!function_exists('cdnurl'))
{

    /**
     * 获取上传资源的CDN的地址
     * @param string $url 资源相对地址
     * @return string
     */
    function cdnurl($url)
    {
        return preg_match("/^https?:\/\/(.*)/i", $url) ? $url : think\Config::get('upload.cdnurl') . $url;
    }

}


if (!function_exists('is_really_writable'))
{

    /**
     * 判断文件或文件夹是否可写
     * @param	string $file 文件或目录
     * @return	bool
     */
    function is_really_writable($file)
    {
        if (DIRECTORY_SEPARATOR === '/')
        {
            return is_writable($file);
        }
        if (is_dir($file))
        {
            $file = rtrim($file, '/') . '/' . md5(mt_rand());
            if (($fp = @fopen($file, 'ab')) === FALSE)
            {
                return FALSE;
            }
            fclose($fp);
            @chmod($file, 0777);
            @unlink($file);
            return TRUE;
        }
        elseif (!is_file($file) OR ( $fp = @fopen($file, 'ab')) === FALSE)
        {
            return FALSE;
        }
        fclose($fp);
        return TRUE;
    }

}

if (!function_exists('rmdirs'))
{

    /**
     * 删除文件夹
     * @param string $dirname 目录
     * @param bool $withself 是否删除自身
     * @return boolean
     */
    function rmdirs($dirname, $withself = true)
    {
        if (!is_dir($dirname))
            return false;
        $files = new RecursiveIteratorIterator(
                new RecursiveDirectoryIterator($dirname, RecursiveDirectoryIterator::SKIP_DOTS), RecursiveIteratorIterator::CHILD_FIRST
        );

        foreach ($files as $fileinfo)
        {
            $todo = ($fileinfo->isDir() ? 'rmdir' : 'unlink');
            $todo($fileinfo->getRealPath());
        }
        if ($withself)
        {
            @rmdir($dirname);
        }
        return true;
    }

}

if (!function_exists('copydirs'))
{

    /**
     * 复制文件夹
     * @param string $source 源文件夹
     * @param string $dest 目标文件夹
     */
    function copydirs($source, $dest)
    {
        if (!is_dir($dest))
        {
            mkdir($dest, 0755);
        }
        foreach (
        $iterator = new RecursiveIteratorIterator(
        new RecursiveDirectoryIterator($source, RecursiveDirectoryIterator::SKIP_DOTS), RecursiveIteratorIterator::SELF_FIRST) as $item
        )
        {
            if ($item->isDir())
            {
                $sontDir = $dest . DS . $iterator->getSubPathName();
                if (!is_dir($sontDir))
                {
                    mkdir($sontDir);
                }
            }
            else
            {
                copy($item, $dest . DS . $iterator->getSubPathName());
            }
        }
    }

}

if (!function_exists('mb_ucfirst'))
{

    function mb_ucfirst($string)
    {
        return mb_strtoupper(mb_substr($string, 0, 1)) . mb_strtolower(mb_substr($string, 1));
    }

}


if (!function_exists('addtion'))
{

    /**
     * 附加关联字段数据
     * @param array $items 数据列表
     * @param mixed $fields 渲染的来源字段
     * @return array
     */
    function addtion($items, $fields)
    {
        if (!$items || !$fields)
            return $items;
        $fieldsArr = [];
        if (!is_array($fields))
        {
            $arr = explode(',', $fields);
            foreach ($arr as $k => $v)
            {
                $fieldsArr[$v] = ['field' => $v];
            }
        }
        else
        {
            foreach ($fields as $k => $v)
            {
                if (is_array($v))
                {
                    $v['field'] = isset($v['field']) ? $v['field'] : $k;
                }
                else
                {
                    $v = ['field' => $v];
                }
                $fieldsArr[$v['field']] = $v;
            }
        }
        foreach ($fieldsArr as $k => &$v)
        {
            $v = is_array($v) ? $v : ['field' => $v];
            $v['display'] = isset($v['display']) ? $v['display'] : str_replace(['_ids', '_id'], ['_names', '_name'], $v['field']);
            $v['primary'] = isset($v['primary']) ? $v['primary'] : '';
            $v['column'] = isset($v['column']) ? $v['column'] : 'name';
            $v['model'] = isset($v['model']) ? $v['model'] : '';
            $v['table'] = isset($v['table']) ? $v['table'] : '';
            $v['name'] = isset($v['name']) ? $v['name'] : str_replace(['_ids', '_id'], '', $v['field']);
        }
        unset($v);
        $ids = [];
        $fields = array_keys($fieldsArr);
        foreach ($items as $k => $v)
        {
            foreach ($fields as $m => $n)
            {
                if (isset($v[$n]))
                {
                    $ids[$n] = array_merge(isset($ids[$n]) && is_array($ids[$n]) ? $ids[$n] : [], explode(',', $v[$n]));
                }
            }
        }
        $result = [];
        foreach ($fieldsArr as $k => $v)
        {
            if ($v['model'])
            {
                $model = new $v['model'];
            }
            else
            {
                $model = $v['name'] ? \think\Db::name($v['name']) : \think\Db::table($v['table']);
            }
            $primary = $v['primary'] ? $v['primary'] : $model->getPk();
            $result[$v['field']] = $model->where($primary, 'in', $ids[$v['field']])->column("{$primary},{$v['column']}");
        }

        foreach ($items as $k => &$v)
        {
            foreach ($fields as $m => $n)
            {
                if (isset($v[$n]))
                {
                    $curr = array_flip(explode(',', $v[$n]));

                    $v[$fieldsArr[$n]['display']] = implode(',', array_intersect_key($result[$n], $curr));
                }
            }
        }
        return $items;
    }

}

function encrypt($string,$key){
    $code = $string;
    return $code;
}

function decrypt($code,$key){
    $string = $code;
    return $string;
}

function userIsLogin(){
    $user_info=session('user_info');
    return $user_info;
}

function curl_get($url,$timeout=30){
    $ch = curl_init();
    if($timeout>0){
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    }
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
    curl_setopt($ch, CURLOPT_MAXREDIRS, 4);
    curl_setopt($ch, CURLOPT_ENCODING, ""); //必须解压缩防止乱码
    $data = curl_exec($ch);
    curl_close($ch);
    return $data;
}
function curl_post($url,$param,$timeout=30){
    $ch = curl_init();
    if($timeout>0){
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    }
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
    curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
    curl_setopt($ch, CURLOPT_MAXREDIRS, 4);
    curl_setopt($ch, CURLOPT_ENCODING, ""); //必须解压缩防止乱码
    curl_setopt($ch, CURLOPT_POST, TRUE);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $param);
    $data = curl_exec($ch);
    curl_close($ch);
    return $data;
}

/**
 * 友好的输出值的代码
 * @param $val mixed 要输出代码的值名称
 * @param $valName string 名称标记
 * @param $exit boolean 是否退出程序
 * @param $hr boolean 是否显示分割线
 * @return string 返回字符串内容或直接退出
 * created by blu10ph
 * */
function var_exp($val,$valName='',$exit=false,$hr=true){
    $str = '';
    if($hr){
        $str .= "\r\n<hr/>\r\n";
    }
    if(!empty($valName)){
        $str .= $valName.':';
    }
    $str .= var_export($val, true);
    if($exit == 'return'){
        return $str;
    }else{
        echo $str;
        if($exit!=false){
            exit;
        }
    }
}

