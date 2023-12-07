function visualizeMesh(vertices, faces)
    figure; 
    patch('Vertices', vertices, 'Faces', faces, 'EdgeColor', 'k', 'FaceColor', 'none'); 
    axis equal; 
    view(3); % Vue en 3D
    title('Maillage initial'); 
end