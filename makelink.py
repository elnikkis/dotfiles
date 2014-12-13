# coding:utf-8

"""
dotfilesのdot.*ファイルをホームにコピーするスクリプト
"""

# dot.から始まるファイル一覧を取得
import glob
files = glob.glob('dot.*')

# このディレクトリの絶対パスを取得
import os
pwd = os.getcwd()
home = os.environ['HOME']

# シンボリックリンクを作成
import subprocess
for filename in files:
    src = os.path.join(pwd, filename)
    dst = os.path.join(home, filename[3:])
    op = 'ln -sin ' + src + ' ' + dst
    print(op)
    subprocess.call(['ln', '-sin', src, dst])

