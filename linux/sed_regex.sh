

#
# sed -i "s/<1>/<2>/g" <file>
# <1>: 匹配的字符串（可以使用正则表达式）
# <2>: 替换的字符串
# <file>: 需要进行操作的文件
#

sed -i "s/abc.*/abc efg/g" test
