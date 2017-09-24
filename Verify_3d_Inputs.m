## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-23

function Verify_3d_Inputs (varargin)
  for i = 1:nargin
    if numel(varargin{i}) ~= 3
      error('Inputs must be 3d. They must have 3 elements each.');
    end
  end
endfunction
