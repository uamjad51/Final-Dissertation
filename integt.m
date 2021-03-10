function out = integt(ym,a)
 out=arrayfun(@(y)integral(@(x)calct(x,a),0,y),ym);
end
