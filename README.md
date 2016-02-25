# WXFrameworkDemo

#iOS动态库制作

动态库制作完成，导入到目标工程中时，需要采取enmbeded方式，另外在Target－－Build Settings－－Search Paths的Framework Search Paths添加$(PROJECT_DIR)

1. Images.xcassets中的素材

（1）只支持png格式的图片

（2） 图片只支持[UIImage imageNamed]的方式实例化，但是不能从Bundle中加载

（3）  在编译时，Images.xcassets中的所有文件会被打包为Assets.car的文件

##动态库资源文件

上面解释了为什么不能使用Images.xcassets文件，需要采取另外一个做法，新建一个Target，选择Bundle，注意这个Bundle的Base SDK是针对MACOSX，需要改成iOS，同时也可将Product Name改成动态库的名称。

接下来就可以在Build Phases中添加图片资源文件了。

在相应的动态库的Target Dependentcies中添加Bundle依赖，在Copy Bundle Resources中添加xib文件。

添加shell脚本，将bundle拷贝到桌面

WX_FRAMEWORK_NAME=${PROJECT_NAME}
ditto "${BUILT_PRODUCTS_DIR}/${WX_FRAMEWORK_NAME}.bundle" \
"${HOME}/Desktop/${WX_FRAMEWORK_NAME}.bundle"

#静态库

构建静态库还比较简单，新建一个Target选择Static Libaray，然后切到Build Phases选项，将待编译的Sources选择，同时将需要开放的头文件copy出去，如果有其他资源文件也应该copy出去。

如果要制作通用静态库，可以建一个shell脚本，进行控制。

在使用静态库时，需要注意一些事项，

1、Other Linker Flags，找到设置后，在其中添加一个参数 -ObjC

2、双击Header Search Paths项，弹出一个浮动窗口，点击+按钮，输入:
$SOURCE_ROOT/include 

接下来就可以使用了。

##通用库

参考下面脚本

```
# Sets the target folders and the final framework product.
# 如果工程名称和Framework的Target名称不一样的话，要自定义FMKNAME
# 例如: FMK_NAME = "MyFramework"
FMK_NAME=${PROJECT_NAME}
# Install dir will be the final output to the framework.
# The following line create it in the root folder of the current project.
INSTALL_DIR=${SRCROOT}/Products/${FMK_NAME}.framework
# Working dir will be deleted after the framework creation.
WRK_DIR=build
DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework
# -configuration ${CONFIGURATION}
# Clean and Building both architectures.
xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build
xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build
# Cleaning the oldest.
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
# Uses the Lipo Tool to merge both binary files (i386 + armv6/armv7) into one Universal final product.
lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"
rm -r "${WRK_DIR}"
open "${INSTALL_DIR}"
```