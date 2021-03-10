function out=integintegt(ym,a)
    out=arrayfun(@(y)integral(@(x)integt(x,a),0,y),ym);
end
