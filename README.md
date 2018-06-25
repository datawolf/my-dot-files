## 说明

需要安装如下软件：

```
vim git ctags cscope
```

注意：新版本的vim最好在8.0以上, 安装方法如下:
```
$ cd /usr/local/src/
$ wget https://github.com/vim/vim/archive/v8.1.0109.tar.gz
$ tar -xvf v8.1.0109.tar.gz
$ cd cd vim-8.1.0109/
$ ./configure --prefix=/usr/local/vim8 --enable-python3interp=yes --enable-pythoninterp=yes
$ make && make install

```

在bashrc中添加：

```
export PATH=$PATH:/usr/local/vim8/bin/
```

## 安装方法

```
# git clone https://github.com/datawolf/my-dot-files
# cd my-dot-files
# ./install.sh
```

打开vim，运行如下命令

```
:PluginInstall
```

然后运行如下命令：

```
# cd ~/.vim/bundle/YouCompleteMe/
# ./install.py  --clang-completer
```
