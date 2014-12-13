# coding:utf-8

"""
dotfilesのdot.*ファイルをホームにコピーするスクリプト
"""

# dot.から始まるファイル一覧を取得
import glob
files = glob.glob('dot.*')

import subprocess
for filename in files:
    subprocess.call(['echo', filename])


