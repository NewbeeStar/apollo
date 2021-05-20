DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "${DIR}/apollo_base.sh"

python /apollo/modules/tools/create_map/convert_map_txt2bin.py \
    -i $1/base_map.txt   \
    -o $1/base_map.bin
# generate routing_map.bin in map directory.
/apollo/bazel-bin/modules/routing/topo_creator/topo_creator \
    --flagfile=modules/routing/conf/routing.conf \
    -alsologtostderr --map_dir=$1
/apollo/bazel-bin/modules/map/tools/sim_map_generator \
    --map_dir=$1 \
    --output_dir=$1