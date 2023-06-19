source config.sh
echo "remote state backup"
cp remote_backend.tf remote_backend.tf.back
sed "s/#{organization_name}/${organization_name}/"
sed -i "s/\#{organization_name}/$organization_name/g" remote_backend.tf
sed -i "s/\#{workspace_name}/$workspace_name/g" remote_backend.tf


echo $config
