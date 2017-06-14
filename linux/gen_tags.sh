
#改脚本会生成经过特殊处理的tag文件
#把这些tag文件合并成一个大文件，就可以生成一个新的可用的tag文件
#主要适用不需要生成某些子目录的tag文件的情况

TAG_FILE=tags
TMP_FILE=out.log
HEAD_DIR=$1

if [ -z "$HEAD_DIR" ]; then
	echo "Do nothing!"
	exit 0
fi

#转换/为\/
HEAD_DIR=${HEAD_DIR//'/'/'\/'}

#生成tags文件 -R 会遍历子目录
ctags   *

#去掉以!开头的注释
sed -i '/^!/'d  $TAG_FILE

touch $TMP_FILE
cat $TAG_FILE | while read line
do
	#echo $line
	#取每行的第二列内容
	echo $line | awk '{print $2}' >> $TMP_FILE
done

#去掉重复的内容
sort -u $TMP_FILE -o  $TMP_FILE

#去掉含有（的数据
sed -i '/(/'d $TMP_FILE

while read line
do
	oldDir=${line//'/'/'\/'}
	#替换原始路径为新的路径
	sed -i "s/\t$oldDir\t/\t$HEAD_DIR\/$oldDir\t/g" $TAG_FILE
done < $TMP_FILE

#删除中间文件
rm -rf $TMP_FILE
