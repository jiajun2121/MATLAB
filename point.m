classdef point
    properties
        x
        y
    end

    properties (SetAccess = private)
        id
    end

    methods
        function self = point(x, y)
            persistent id_
            if (isempty(id_)); id_ = 0; end

            self.id = id_;
            self.x = x;
            self.y = y;

            id_ = id_ + 1;
        end

        function disp(self)
            fprintf(1, 'point (%d,%d)\n', self.x, self.y);
        end

        function move(self, varargin)
            assert(numel(varargin) >= 1);

            if (isstruct(varargin{1}))
                % move(obj, s)
                s = varargin{1};
                assert(all(isfield(s, {'x', 'y'})));
                self.x = s.x;
                self.y = s.y;
            else
                % move(obj, x, y)
                assert(numel(varargin) >= 2);

                x = varargin{1};
                y = varargin{2};

                self.x = x;
                self.y = y;
            end
        end

    end
end