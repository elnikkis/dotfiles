# coding:utf-8

"""
dotfilesのdot.*ファイルをホームにコピーするスクリプト
"""

# このディレクトリの絶対パスを取得
import os
#pwd = os.getcwd()
pwd = os.path.abspath(os.path.dirname(__file__))
home = os.environ['HOME']

# dot.から始まるファイル一覧を取得
import glob
files = glob.glob(os.path.join(pwd, 'dot.*'))

# シンボリックリンクを作成
import subprocess
for file in files:
    filename = os.path.basename(file)
    src = os.path.join(pwd, filename)
    dst = os.path.join(home, filename[3:])
    op = 'ln -sin ' + src + ' ' + dst
    print(op)
    subprocess.call(['ln', '-sin', src, dst])

