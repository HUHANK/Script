
#�Ľű������ɾ������⴦���tag�ļ�
#����Щtag�ļ��ϲ���һ�����ļ����Ϳ�������һ���µĿ��õ�tag�ļ�
#��Ҫ���ò���Ҫ����ĳЩ��Ŀ¼��tag�ļ������

TAG_FILE=tags
TMP_FILE=out.log
HEAD_DIR=$1

if [ -z "$HEAD_DIR" ]; then
	echo "Do nothing!"
	exit 0
fi

#ת��/Ϊ\/
HEAD_DIR=${HEAD_DIR//'/'/'\/'}

#����tags�ļ� -R �������Ŀ¼
ctags   *

#ȥ����!��ͷ��ע��
sed -i '/^!/'d  $TAG_FILE

touch $TMP_FILE
cat $TAG_FILE | while read line
do
	#echo $line
	#ȡÿ�еĵڶ�������
	echo $line | awk '{print $2}' >> $TMP_FILE
done

#ȥ���ظ�������
sort -u $TMP_FILE -o  $TMP_FILE

#ȥ�����У�������
sed -i '/(/'d $TMP_FILE

while read line
do
	oldDir=${line//'/'/'\/'}
	#�滻ԭʼ·��Ϊ�µ�·��
	sed -i "s/\t$oldDir\t/\t$HEAD_DIR\/$oldDir\t/g" $TAG_FILE
done < $TMP_FILE

#ɾ���м��ļ�
rm -rf $TMP_FILE
