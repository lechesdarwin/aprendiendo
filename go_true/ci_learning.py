#!/usr/bin/python3
# coding=utf8

# python @indetificator .languaje filename_input
# python create workspace
# python force clear TODO:implements

import re
import sys
import os

id_ = sys.argv[1].split("@")[1]
regex = r"```\{#"+id_+r"\s?(\.\w+).*\}\n([\s\S]*?\n)```"
path_default = "/tmp/default_path_ci_learning"

def extension_languaje(languaje):
    if languaje == "python":
        return ".py"
    elif languaje == "go":
        return ".go"
    elif languaje == "c":
        return ".c"

def return_string_file(filename):
    with open(filename, "r") as f:
        content = f.read()
    return content

def get_write_full_path(filename):
    if os.environ.get("work_dir") != None:
        return f"{os.environ.get('work_dir')}/{filename}"
    else:
        return f"{path_default}/{filename}"

def extract_code(filename, indetificator):
    code_raw = return_string_file(filename)
    matches = re.finditer(regex, code_raw, re.MULTILINE | re.IGNORECASE)
    for matchNum, match in enumerate(matches, start=1):
        print ("Match {matchNum} was found at {start}-{end}: {match}".format(matchNum = matchNum, start = match.start(), end = match.end(), match = match.group()))
        code = match.group(2)
        lang = match.group(1)
        indetificator = match.group(1)
    final_file = f"{indetificator[1:]}{extension_languaje(lang[1:])}"
    print("final file:",final_file)
    with open(get_write_full_path(final_file), "w") as f:
        f.write(code)
    return final_file




def init():
    args = sys.argv
    if len(args) == 4:
        save = extract_code(filename=args[3], indetificator=args[1])
        print("OK! save on:", save)
    elif len(args) == 3:
        if os.environ.get("work_dir") != None:
            os.mkdir(os.environ.get("work_dir"), 0o755)
            print(f"Path create in {os.environ.get('work_dir')}")
        else:
            os.mkdir(path_default, 0o755)
            print(f"PATH CREATE IN {path_default}")

init()

# test_str = ("cdcdc\n"
# 	"cdcsdcs\n"
# 	"c\n"
# 	"sdc\n"
# 	"sd\n"
# 	"c\n"
# 	"sd\n"
# 	"csd\n\n"
# 	"```{#identificator .languaje .extras ...}\n"
# 	"print(\"hellp\")\n"
# 	"def()\n"
# 	"```\n"
# 	"csdcsdc\n"
# 	"c\n"
# 	"sd\n"
# 	"c\n"
# 	"sd\n"
# 	"c")

# matches = re.finditer(regex, test_str, re.MULTILINE | re.IGNORECASE)



# for matchNum, match in enumerate(matches, start=1):
    
#     print ("Match {matchNum} was found at {start}-{end}: {match}".format(matchNum = matchNum, start = match.start(), end = match.end(), match = match.group()))
