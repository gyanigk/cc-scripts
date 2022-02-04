## cc_script - Simple script for Competitive/Project directory setup 
   - Created on ->  Feb02/04/22,2022
-----------
### Setup
1. Clone the repository to local
```
git clone https://github.com/p4rZ/cc_scripts 
cd cc_scripts
```
2. Run the script in its repository in the given usuage format
``` Script to create individual problem folders
Usage : 
 $bash cc.sh [-cp,-cpi,-pr] [contest_name,project_name] [-cp:{#problems}, -cpi:{#problems #inputs},-pr:{#tasks}] 
```
3. You can always edit the simple script as changing default directories
```
- cp - default_dir $HOME/cp/
- project - default_dir $HOME/projects/
```

### FAQ
## 1. What I get running the cc_prob.sh will be a 
	- folder-cpp,input_files 
## 2. What i want is implement this into three formats 
	- cp # create a dir and add set of questions from A-Z.cpp and A-Z.txt inputs
	- cpi # create a dir and add .cpp,mul_input_files
	- pr #create a dir and set of dirs and default files in each of them
	- default=True create README in main_dir always with timestamp of creation of the dir and dir_name	
```
[options : -cp , -cpi, -pr -default=True]
```
## 3. Add default templates to add to my existing files [TBD]
---------

TEMPLATE layout : 
```
projects
- /project_name
	-> /data 
	-> /data-analysis
	-> /code
		--> /task-1
		--> /task-2
	-> /demo
	-> /misc
	-> README.md
```

### resources and helpful sites 
- https://codeforces.com/blog/entry/93882
- https://www.horcrux2301.dev/my-competitive-programming-setup/
- https://linuxize.com/post/bash-case-statement/
- https://linuxhint.com/30_bash_script_examples/#t15



