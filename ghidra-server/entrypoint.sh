#! /bin/bash

cat <<EOF >> /ghidra/repositories/~admin/adm.cmd
-add ishtar
EOF

exec /ghidra/server/ghidraSvr console