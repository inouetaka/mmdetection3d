if [ -z "$1" ]; then
  echo "Usage: $0 {train|demo}"
  exit 1
fi

if [ "$1" = "train" ]; then
  bash mmdetection3d/tools/dist_train.sh mmdetection3d/projects/BEVFusion/configs/bevfusion_lidar_voxel0075_second_secfpn_8xb4-cyclic-20e_nus-3d.py 4

# demoの場合
elif [ "$1" = "demo" ]; then
  python mmdetection3d/projects/BEVFusion/demo/multi_modality_demo.py \
    mmdetection3d/demo/data/nuscenes/n015-2018-07-24-11-22-45+0800__LIDAR_TOP__1532402927647951.pcd.bin \
    mmdetection3d/demo/data/nuscenes/ \
    mmdetection3d/demo/data/nuscenes/n015-2018-07-24-11-22-45+0800.pkl \
    mmdetection3d/projects/BEVFusion/configs/bevfusion_lidar-cam_voxel0075_second_secfpn_8xb4-cyclic-20e_nus-3d.py \
    bevfusion_converted.pth \
    --cam-type all \
    --score-thr 0.2
else
    echo "Invalid argument. Use 'train' or 'demo'. 'XXX'"
    exit 1
fi
