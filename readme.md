# 安装pip
    wget https://files.pythonhosted.org/packages/93/ab/f86b61bef7ab14909bd7ec3cd2178feb0a1c86d451bc9bccd5a1aedcde5f/pip-19.1.1.tar.gz
    tar -zxvf pip-19.1.1.tar.gz
    cd pip-19.1.1
    python setup.py install

# 安装pyinstaller
    pip install pyinstaller

# 编译pssh为二进制文件备用
最新版本下载地址，需要翻墙：https://code.google.com/archive/p/parallel-ssh/downloads
    tar -zxvf pssh-2.3.1.tar.gz
    cd pssh-2.3.1
    cp bin/* ./
    pyinstaller -F pnuke
    pyinstaller -F prsync
    pyinstaller -F pscp
    pyinstaller -F pslurp
    pyinstaller -F pssh
    pyinstaller -F pssh-askpass

# 无需使用秘钥，直接用户名密码方式登录
源码下载：https://github.com/knktc/insecure_pssh/archive/master.zip
编译二进制方式与上面一致



