% Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
% Created: 2017-09-23

function Verify_Numerical_Inputs (varargin)
  for i = 1:nargin
    if ~isnumeric(varargin{i})
      error(strcat('Argument: ', inputname(i), ' must be numerical'));
    end
  end
end

