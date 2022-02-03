#!/bin/bash
#cc.sh
#
#Usuage  
#
#1. What I get running the cc_prob.sh will be a 
#	folder-cpp,input_files 
#2. What i want is implement this into three formats 
#	-cp # create a dir and add set of questions from 			A-Z.cpp and A-Z.txt inputs
#	-cpi # create a dir and add .cpp,mul_input_files
#	-pr #create a dir and set of dirs and default files in each of them
#
#	-default=True create README in main_dir always with timestamp of creation of the dir and dir_name
#	
#[options : -cp , -cpi, -pr -default=True]
#3. Add default templates to add to my existing files 
#
#project layout : 
#projects
#->project_name/
#	=> data 
#	=> data-analysis
#	=> code
#		->task-1
#		->task-2
#	=> demo
#	=> misc
#	=> README.md
#
#Script to create individual problem folders
# Usage : !bash cc.sh [-cp,-cpi,-pr] [contest_name,project_name] [-cp:{#problems}, -cpi:{#problems #inputs},-pr:{#tasks}] 
#
#cp - default_dir ~/home/parz/cp/
#project - default_dir ~/home/parz/projects/

root_cp="$HOME/cp/"
root_proj="$HOME/projects/"
current_dir=$PWD


len="$#"
files=0
count=0

type=0
if [ $1 = "-cp" ]; then
	#echo "cp true"
	type=1
	cd "$root_cp"
	echo "$PWD $type"
	working_dir=$root_cp
elif [ $1 = "-cpi" ];then
	#echo "cpi true"
	type=2
	cd "$root_cp"
	echo "$PWD $type"
	working_dir=$root_cp
elif [ $1 = "-pr" ]; then
	#echo "pr true"
	type=3
	cd "$root_proj"
	echo "$PWD $type"
	working_dir=$root_proj
else
	echo "Failed"
fi

for var in "$@"
do
	(( count++ ))
	echo "$var"
done
echo "$count"

case $type in
	1)
		main_dir=$2
		p=$3
		t=0
		if [ -d $main_dir ];then
			echo "dir exists. skipping .."
		else
			working_dir+=$main_dir
			echo "$working_dir"
			mkdir $working_dir
			echo "dir created."
		fi
		cd $working_dir
		for x in {a..z}
		do
			(( t++ ))
			if [ $t == $p ]; then
				break
			fi

			prog="$working_dir/$x.cpp"
			in="$working_dir/$x.txt"
			touch $prog $in
			#tree -c $working_dir
		done
		cd $working_dir
		touch README.md
		tree -f $working_dir
		time=$(/bin/date +%b%m,%Y)
		
		echo -e "### $main_dir 
			- Creation Date : $time" > README.md
		cat README.md
		;;
	2)
		main_dir=$2
		p=$3
		i=$4
		t=0
	
		if [ -d $main_dir ];then
			echo "dir exists. skipping .."
		else
			working_dir+=$main_dir
			echo "$working_dir"
			mkdir $working_dir
			echo "dir created."
		fi
		cd $working_dir
		for x in {a..z}
		do
			(( t++ ))
			if [ $t == $p ]; then
				break
			fi
 			command="bash cpi.sh $x $i"
			$command
			#tree -c $working_dir
		done
		touch README.md
		tree -f $working_dir
		time=$(/bin/date +%b%m,%Y)
		
		echo -e "### $main_dir 
			- Creation Date : $time" > README.md
		cat README.md
		;;
	3)
		main_dir=$2
		t=$3
		
		if [ -d $main_dir ];then
			echo "dir exists. skipping .."
		else
			working_dir+=$main_dir
			echo "$working_dir"
			mkdir $working_dir
			echo "dir created."
		fi
		cd $working_dir
		mkdir -p $working_dir/{data,data_analysis,code,demo,misc}
		for i in $(seq 1 $t)
		do
			mkdir "$working_dir/code/task_$i"
		done
		touch README.md
		time=$(/bin/date +%b%m,%Y)
		tree -f $working_dir
		echo -e "### $main_dir 
			- Creation Date : $time 
			- Description : Will fill when i feel like ;)" > README.md
		cat README.md
		;;
	*)
		echo "FAILED"
		;;
esac 








