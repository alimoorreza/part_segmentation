
src_path         = '/Users/reza/Downloads/partseg/Fishdataset_corrupted/';
dst_path         = '/Users/reza/Downloads/partseg/Fishdataset/';


output_dir      = [dst_path '/train/images' ];
if ~isfolder(output_dir )
    mkdir(output_dir)
end
output_dir      = [dst_path '/train/labels' ];
if ~isfolder(output_dir )
    mkdir(output_dir)
end

output_dir      = [dst_path '/validation/images' ];
if ~isfolder(output_dir )
    mkdir(output_dir)
end
output_dir      = [dst_path '/validation/labels' ];
if ~isfolder(output_dir )
    mkdir(output_dir)
end


% file_names = dir([ label_path '/*.png' ]);
% 
% for ii=1:length(file_names)
% 
%     cur_name = file_names(ii).name;
%     label_map = imread( [label_path '/' cur_name] );
%     disp([num2str(ii) '/' num2str(length(file_names)) ': unique names: ']);
%     unique(label_map)
% 
% 
% end

change_mapping(src_path, dst_path, 'train')
change_mapping(src_path, dst_path, 'validation')



function change_mapping(src_path, dst_path, split_name)

    image_files                   = dir([src_path '/' split_name '/images/*.png']);
    total_files                      = length(image_files);
    for ii=1:total_files
    
        cur_image_name = image_files(ii).name;
        
        % done RGB
        copyfile([src_path  '/' split_name '/images/' cur_image_name ], [dst_path '/' split_name '/images/'], 'f');

        % done relabeled Mask
        label_map           = imread( [src_path  '/' split_name '/labels/' cur_image_name ]);
        %disp([num2str(ii) '/' num2str(length(file_names)) ': unique names: ']);
        unique_ids          = unique(label_map);
        relabeled_map    = zeros(size(label_map));

        for jj=1:length(unique_ids)
            cur_unique_id = unique_ids(jj);
            idx = find(label_map == cur_unique_id);
            relabeled_map(idx) = jj-1;

        end
        imwrite(uint8(relabeled_map), [dst_path  '/' split_name '/labels/' cur_image_name ]);
        
        disp([num2str(ii) '/' num2str(total_files) ': ' cur_image_name ' DONE processing']);        

    end
      
end