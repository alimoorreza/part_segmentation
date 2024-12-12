
%label_path = '/Users/reza/Downloads/partseg/Fishdataset/train/labels/';
%label_path = '/Users/reza/Downloads/partseg/Fishdataset/validation/labels/';
%file_names = dir([ label_path '/*.png' ]);

%{
image_path = '/Users/reza/Downloads/partseg/Fishdataset/train/images/';
file_names = dir([ image_path '/*.png' ]);
%}
image_path = '/Users/reza/Downloads/partseg/Fishdataset/validation/images/';
file_names = dir([ image_path '/*.png' ]);


for ii=1:length(file_names)

    cur_name = file_names(ii).name;
    rgb = imread( [image_path '/' cur_name] );
    [row,col,ch] = size(rgb);
    
    if (ch == 1)
        disp([num2str(ii) '/' num2str(length(file_names)) 'file_name:' cur_name ':  [' num2str(row) ',' num2str(col) ',' num2str(ch) ']']);    
    end

    %{
    label_map = imread( [label_path '/' cur_name] );
    disp([num2str(ii) '/' num2str(length(file_names)) ': unique names: ']);
    unique(label_map)
    % figure; imagesc(label_map);
    %}

end