## Copyright (C) 2017 Eseoghene Okonofua
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} Verify_Numerical_Inputs (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Eseoghene Okonofua <EseO@Eseoghenes-MacBook-Pro.local>
## Created: 2017-09-23

function Verify_Numerical_Inputs (varargin)
  for i = 1:nargin
    if ~isnumeric(varargin{i})
      error(strcat('Argument: ', inputname(i), ' must be numerical'));
    end
  end
endfunction

