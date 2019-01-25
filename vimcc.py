#!/usr/bin/env python3
import sys
import os
import configparser
import shutil
import subprocess


def find_project_config_file(directory, max_levels = 5):
    if max_levels == 0 or directory == "/" or directory == "":
        return None  #Config file not found

    fileName = os.path.join(directory, "config/config")
    if os.path.isfile(fileName):
        return fileName
    else:
        return find_project_config_file(os.path.dirname(directory), max_levels-1)

#Returns true: success, false: no success
def copy_file_from_subprojects(file_name):
    abs_file_name = os.path.abspath(file_name)
    #Find project config file
    cfgFile = find_project_config_file(os.path.dirname(abs_file_name))
    if not cfgFile:
        print("Could not find the config file of the WinCC project for '{}'!"
              "".format(file_name))
        return False

    config = configparser.RawConfigParser(dict_type=MultiOrderedDict, strict=False)
    if not config.read(cfgFile):
        print("Could not parse config file '{}'!".format(cfgFile))
        return False

    projDirs = config.get("general", "proj_path", fallback=None)
    if not projDirs:
        print("Could not parse general:proj_path from '{}'!".format(cfgFile))
        return False

    projDirs = [ directory.replace('"', '') for directory in projDirs]

    #Main and sub project directories
    mainDir = projDirs.pop(-1)
    subDirs = projDirs

    rel_file_name = abs_file_name.replace(mainDir+"/", "")
    for subDir in subDirs[::-1]:  #subDirs are listed from least to highest priority
        new_file_name = os.path.join(subDir, rel_file_name)
        if os.path.isfile(new_file_name):
            shutil.copy2(new_file_name, file_name)
            print("Copied '{}' to '{}'!".format(new_file_name, file_name))
            return True

    print("File '{}' not found in subprojects.".format(file_name))
    return False





#Necessary to load duplicate keys/options from config file
from collections import OrderedDict
class MultiOrderedDict(OrderedDict):
    def __setitem__(self, key, value):
        if isinstance(value, list) and key in self:
            self[key].extend(value)
        else:
            super(OrderedDict, self).__setitem__(key, value)
    def keys(self):
        return super(OrderedDict, self).keys()


if __name__ == "__main__":
    allFiles = sys.argv[1:] #All provided files

    #Existing and missing files in current directory
    existingFiles = []
    missingFiles = []

    for file in allFiles:
        if os.path.isfile(file) or copy_file_from_subprojects(file):
            existingFiles.append(file)
        else:
            missingFiles.append(file)

    subprocess.run(["vim"]+existingFiles+missingFiles)
