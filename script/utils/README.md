# Utils (Utilities)
* libpath.txt: path for library source of bash scripts. 
* util.sh
  * base setting for all bash scripts
  * setup_color: set color variables
    * KNRM, KBLK, KGRN, KYEL, KBLU, KMAG, KCYN, KWHT
  * msg: echo to stderr for user to know
  * die: exit program with msg and code
  * read_file: read file and return. can save to varaible as Array
  * include: source lib with alias. see libpath.txt
  * $BASE: path of bash_script/script
