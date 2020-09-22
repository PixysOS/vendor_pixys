function __print_pixys_functions_help() {
cat <<EOF
Additional PIXYS functions:
- gerrit:          Adds a remote for PixysOS Gerrit
- mka:      Builds using SCHED_BATCH on all processors
EOF
}

function repopick() {
    T=$(gettop)
    $T/vendor/pixys/build/tools/repopick.py $@
}

function gerrit()
{
    if [ ! -d ".git" ]; then
        echo -e "Please run this inside a git directory";
    else
        if [[ ! -z $(git config --get remote.gerrit.url) ]]; then
            git remote rm gerrit;
        fi
        [[ -z "${GERRIT_USER}" ]] && export GERRIT_USER=$(git config --get gerrit.pixysos.com.username);
        if [[ -z "${GERRIT_USER}" ]]; then
            git remote add gerrit $(git remote -v | grep PixysOS | awk '{print $2}' | uniq | sed -e "s|https://github.com/PixysOS|ssh://gerrit.pixysos.com:29418/PixysOS|");
        else
            git remote add gerrit $(git remote -v | grep PixysOS | awk '{print $2}' | uniq | sed -e "s|https://github.com/PixysOS|ssh://${GERRIT_USER}@gerrit.pixysos.com:29418/PixysOS|");
        fi
    fi
}

function fixup_common_out_dir() {
    common_out_dir=$(get_build_var OUT_DIR)/target/common
    target_device=$(get_build_var TARGET_DEVICE)
    if [ ! -z $AOSP_FIXUP_COMMON_OUT ]; then
        if [ -d ${common_out_dir} ] && [ ! -L ${common_out_dir} ]; then
            mv ${common_out_dir} ${common_out_dir}-${target_device}
            ln -s ${common_out_dir}-${target_device} ${common_out_dir}
        else
            [ -L ${common_out_dir} ] && rm ${common_out_dir}
            mkdir -p ${common_out_dir}-${target_device}
            ln -s ${common_out_dir}-${target_device} ${common_out_dir}
        fi
    else
        [ -L ${common_out_dir} ] && rm ${common_out_dir}
        mkdir -p ${common_out_dir}
    fi
}

function mka() {
   local T=$(gettop)
   if [ "$T" ]; then
       case `uname -s` in
           Darwin)
               m "$@" -j `sysctl hw.ncpu|cut -d" " -f2` "$@"
               ;;
           *)
               m "$@" -j$(cat /proc/cpuinfo | grep "^processor" | wc -l) "$@"
               ;;
       esac
     else
       echo "Couldn't locate the top of the tree.  Try setting TOP."
   fi
}
