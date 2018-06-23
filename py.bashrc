py_help_re()
{
	echo --import 
	echo import re
	echo -- 提取变量
	echo line="xA are B C"
	echo "index = re.match(r'(.) are (.*?) .*',line,re.M|re.I) --index=none"
	echo "index = re.match(r'(.*) are (.*?) .*',line,re.M|re.I)--"
	echo "index.group() -- xA are B C"
	echo "index.group(1) -- xA"
	echo "index.group(2) -- B"
	echo "index = re.search(r'(.) are (.*?) .*',line,re.M|re.I)"
	echo "index.group() -- A are B C"
	echo "index.group(1) -- A"
	echo "index.group(2) -- B"
	echo -- 结论:match如果一开始匹配不到, 就返回none, search如果一开始匹配不到, 就从下一个位置开始匹配
	echo -- 替换
	echo "re.sub('content', 'style','geek_content.jpg') -- return geek_style.jpg"




}
