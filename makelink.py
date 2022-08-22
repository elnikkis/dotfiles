# -*- coding: utf-8 -*-

"""
dotfilesのdot.*ファイルを$HOMEにコピーするスクリプト
"""

import os
import glob
import subprocess


def parse_args():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', dest='force', help='Force create symlinks', action='store_true')
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()

    # 現在のディレクトリの絶対パスを取得
    pwd = os.path.abspath(os.path.dirname(__file__))
    home = os.environ['HOME']

    # dot.から始まるファイル一覧を取得
    files = glob.glob(os.path.join(pwd, 'dot.*'))

    if args.force is True:
        option = '-sfn'
    else:
        option = '-sin'

    # シンボリックリンクを作成
    for file in files:
        filename = os.path.basename(file)
        src = os.path.join(pwd, filename)
        dst = os.path.join(home, filename[3:])  # Remove 'dot.'
        cmd = ['ln', option, src, dst]
        print(' '.join(cmd))
        subprocess.call(cmd)

