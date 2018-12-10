cat './.mds-list' | while read line || [[ -n ${line} ]]
do
    testseq="zh.md"
    if [[ $line =~ $testseq || "$line" == "" ]]; then
        echo "skip $line"
    else
        lowline=`echo "$line" | awk '{print tolower($0)}'`
        # lowwer string
        zh=${line//source\//}
        dir=$(dirname $zh)
        
        source_readme="./source/readme.md"
        if [[ $lowline == $source_readme ]];then
        # source/[readme|REAMDE].md => en.md
        filename="en.md"
        else 
        # source/other.md => ./other.md
        filename=$(basename $zh)
        fi
        echo "$line >> $dir/$filename"
        mkdir -p $dir && cp $line "$_/$filename"
    fi
done