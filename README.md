## Swift项目中接入swift-protobuf

### 环境配置

以安装homebrew为前提，进行protocolBuffer的环境配置。
``` ruby
brew install automake

brew install libtool

brew install protobuf
```

如果你是使用oc的话，环境配置已经结束了。如果你是使用swift的话，还需要安装一下

``` ruby
brew install swift-protobuf
```


### 项目中集成

在项目中通过Cocoapods集成苹果爸爸封装的SwiftProtobuf库。
``` ruby

pod 'SwiftProtobuf', '~> 1.0'

```

### 使用方式

先造一个.proto的文件数据：
``` ruby
syntax = "proto2";
message Person {
    required int32 id = 1;
    required string name = 2;
    optional string email = 3;
}
```
 写的例子比较简单，[这里](https://developers.google.com/protocol-buffers/docs/proto)有详细的语法。([中文版](http://blog.csdn.net/sylar_d/article/details/51325987))

然后通过之前安装好的protobuf命令行把.proto文件转化为swift的模型文件：
```ruby
protoc  person.proto --swift_out="./"
```
执行完后会在当前目录生成一个Person.pb.swift文件，直接拖到项目中使用就好了。

在项目中的代码实现：

``` swift
        // 创建一个Person的对象
        var person = Person()
        user.email = "357997194@qq.com"
        user.id = 12
        user.name = "赵大宝"
        
        // 序列化Person数据
        let data = try! person.serializedData()
        
        // 反序列化Person数据
        let person2 = try! Person(serializedData: data)
        
```
为了方便直接用try!。。这个习惯不好。
