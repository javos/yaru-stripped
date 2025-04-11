#!/bin/bash

working_dir=`pwd`
icons_dir='/usr/share/icons'
stripped_dir='/home/vondadil/Pictures/Yaru - Stripped'

SIZES=(8 16 22 24 32 48 256)

TYPES=(apps places status)

COLORS=(default red blue sage olive purple yellow magenta wartybrown prussiangreen)

MODES=("light")

ICONS_APPS=(app-center.png filemanager-app.png file-manager.png nautilus.png org.gnome.Nautilus.png software-center.png softwarecenter.png software-properties-gtk.png software-properties.png software-store.png software-updater.png synaptic.png system-file-manager.png system-software-update.png ubiquity.png ubuntusoftware.png update-manager.png update-notifier.png)

ICONS_PLACES=(folder-documents.png folder-download.png folder-dropbox.png folder-music.png folder-pictures.png folder.png folder-publicshare.png folder-remote.png folder-templates.png folder-videos.png inode-directory.png insync-folder.png user-home.png)

ICONS_STATUS=(folder-drag-accept.png folder-open.png)

for color in ${COLORS[@]}; do
	color_ext="-${color}"
	
	if [ "${color}" == "default" ]; then
		color_ext=""
	fi
	
	for mode in ${MODES[@]}; do
		mode_ext=""
		if [ "${mode}" == "dark" ]; then
			mode_ext="-${mode}"
		fi
		
		src_dir="${icons_dir}/Yaru${color_ext}${mode_ext}"
		dest_dir="${stripped_dir}/Yaru-stripped${color_ext}${mode_ext}"
		
		mkdir -p "${dest_dir}"
		cp "${working_dir}/index-sample.theme" "${dest_dir}/index.theme"
		sed -i -e "s/Yaru-stripped/Yaru-stripped${color_ext}${mode_ext}/g" "${dest_dir}/index.theme"
		
		for size in ${SIZES[@]}; do
			size_folder="${size}x${size}"
		
			for filename in ${ICONS_APPS[@]}; do
				mkdir -p "${dest_dir}/${size_folder}/apps"
				mkdir -p "${dest_dir}/${size_folder}@2x/apps"
				
				src_file="${src_dir}/${size_folder}/apps/${filename}"
				src_file_2x="${src_dir}/${size_folder}@2x/apps/${filename}"
				
				[[ -f "$src_file" ]] && echo "copying ${filename}" && cp $src_file "${dest_dir}/${size_folder}/apps/${filename}"
				[[ -f "$src_file_2x" ]] && echo "copying ${filename} 2x" && cp $src_file_2x "${dest_dir}/${size_folder}@2x/apps/${filename}"
			done
			
			for filename in ${ICONS_PLACES[@]}; do
				mkdir -p "${dest_dir}/${size_folder}/places"
				mkdir -p "${dest_dir}/${size_folder}@2x/places"
				
				src_file="${src_dir}/${size_folder}/places/${filename}"
				src_file_2x="${src_dir}/${size_folder}@2x/places/${filename}"
				
				[[ -f "$src_file" ]] && echo "copying ${filename}" && cp $src_file "${dest_dir}/${size_folder}/places/${filename}"
				[[ -f "$src_file_2x" ]] && echo "copying ${filename} 2x" && cp $src_file_2x "${dest_dir}/${size_folder}@2x/places/${filename}"
			done
			
			for filename in ${ICONS_STATUS[@]}; do
				mkdir -p "${dest_dir}/${size_folder}/status"
				mkdir -p "${dest_dir}/${size_folder}@2x/status"
				
				src_file="${src_dir}/${size_folder}/status/${filename}"
				src_file_2x="${src_dir}/${size_folder}@2x/status/${filename}"
				
				[[ -f "$src_file" ]] && echo "copying ${filename}" && cp $src_file "${dest_dir}/${size_folder}/status/${filename}"
				[[ -f "$src_file_2x" ]] && echo "copying ${filename} 2x" && cp $src_file_2x "${dest_dir}/${size_folder}@2x/status/${filename}"
			done
		done
	done
done


