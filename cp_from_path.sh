SOURCE_DIR="/Users/mamingkang/IPDSDK_workPace/IPDSDK-iOS"
TARGET_DIR="$(pwd)/IPDSDK"
# if [ -n $1 ]
# then
#     SOURCE_DIR=$1
# fi
echo "输入路径为：$SOURCE_DIR";
echo "目标路径为：$TARGET_DIR";

if [ -d $TARGET_DIR ]
then
    cp -r $SOURCE_DIR/IPDSDK/IPDSDK_Products/IPDSDK.framework                                                   IPDSDK/IPDAdSDK
    cp -r $SOURCE_DIR/IPDSDKCore/IPDSDKCore_Products/IPDSDKCore.framework                                       IPDSDK/IPDAdSDK
    cp -r $SOURCE_DIR/IPDSDKModuleBD/IPDSDKModuleBD_Products/libIPDSDKModuleBD.a                                IPDSDK/IPDSDKModuleBD
    cp -r $SOURCE_DIR/IPDSDKModuleCSJ/IPDSDKModuleCSJ_Products/libIPDSDKModuleCSJ.a                             IPDSDK/IPDSDKModuleCSJ
    cp -r $SOURCE_DIR/IPDSDKModuleDSP/IPDSDKModuleDSP_Products/libIPDSDKModuleDSP.a                             IPDSDK/IPDSDKModuleDSP
    cp -r $SOURCE_DIR/IPDSDKModuleGDT/IPDSDKModuleGDT_Products/libIPDSDKModuleGDT.a                             IPDSDK/IPDSDKModuleGDT
    cp -r $SOURCE_DIR/IPDSDKModuleGoogle/IPDSDKModuleGoogle_Products/libIPDSDKModuleGoogle.a                    IPDSDK/IPDSDKModuleGoogle
    cp -r $SOURCE_DIR/IPDSDKModuleGoogle/IPDSDKModuleGoogle_Products/IPDSDKModuleGoogle/IPDSDKModuleGoogle.h    IPDSDK/IPDSDKModuleGoogle
    cp -r $SOURCE_DIR/IPDSDKModuleKS/IPDSDKModuleKS_Products/libIPDSDKModuleKS.a                                IPDSDK/IPDSDKModuleKS
    cp -r $SOURCE_DIR/IPDSDKModuleMTG/IPDSDKModuleMTG_Products/libIPDSDKModuleMTG.a                             IPDSDK/IPDSDKModuleMTG
    cp -r $SOURCE_DIR/IPDSDKModuleSIG/IPDSDKModuleSIG_Products/libIPDSDKModuleSIG.a                             IPDSDK/IPDSDKModuleSIG
    cp -r $SOURCE_DIR/IPDSDKModulePangle/IPDSDKModulePangle_Products/libIPDSDKModulePangle.a                    IPDSDK/IPDSDKModulePangle
    cp -r $SOURCE_DIR/IPDSDKModulePangle/IPDSDKModulePangle_Products/IPDSDKModulePangle/IPDSDKModulePangle.h    IPDSDK/IPDSDKModulePangle
    cp -r $SOURCE_DIR/IPDSDKModuleBeiZi/IPDSDKModuleBeiZi_Products/libIPDSDKModuleBeiZi.a                       IPDSDK/IPDSDKModuleBeiZi
    cp -r $SOURCE_DIR/IPDSDKModuleWM/IPDSDKModuleWM_Products/libIPDSDKModuleWM.a                                IPDSDK/IPDSDKModuleWM
    cp -r $SOURCE_DIR/IPDSDKModuleTanX/IPDSDKModuleTanX_Products/libIPDSDKModuleTanX.a                          IPDSDK/IPDSDKModuleTanX
    cp -r $SOURCE_DIR/IPDSDKModuleTanX/IPDSDKModuleTanX_Products/IPDSDKModuleTanX/IPDSDKModuleTanX.h            IPDSDK/IPDSDKModuleTanX
    cp -r -P $SOURCE_DIR/IPDSDKDemo/IPDSDKDemo/lib/SubModuleDependencys/TanX/*                                  IPDSDK/IPDSDKModuleTanX

else
    echo "未检测到有效目标路径，请检查脚本所在目录下是否存在IPDSDK"
fi
