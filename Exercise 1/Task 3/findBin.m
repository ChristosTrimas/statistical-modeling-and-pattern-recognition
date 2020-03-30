function index = findBin(value, binEnds)
    numBins = length(binEnds) - 1;
    % return the index of the bin where value belongs {1, ..., numBins}.
    % {1,2,3}
    if (value < binEnds(1)) || (value>binEnds(4))
        fprintf('Wrong value\n')
    elseif (value>=binEnds(1)) && (value<binEnds(2))
        index = [1 0 0]';
    elseif (value>=binEnds(2)) && (value<binEnds(3))
        index = [0 1 0]';
    elseif (value>=binEnds(3)) && (value<=binEnds(4))
        index = [0 0 1]';
    end
end