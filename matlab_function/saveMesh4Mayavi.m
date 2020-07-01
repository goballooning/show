function saveMesh4Mayavi(file_name, fv, colors)

x = fv.vertices(:, 1);
y = fv.vertices(:, 2);
z = fv.vertices(:, 3);
triangles = fv.faces;


save(file_name, 'x', 'y', 'z', 'triangles', 'colors', '-v7');

end %
