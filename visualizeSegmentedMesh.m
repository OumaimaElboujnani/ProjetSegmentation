function visualizeSegmentedMesh(vertices, faces, groups)
    figure; 
    colormap(jet(max(groups))); % Choisir une palette de couleurs
    patch('Vertices', vertices, 'Faces', faces, 'FaceVertexCData', groups, 'FaceColor', 'flat', 'EdgeColor', 'none'); % Dessiner le maillage segmenté
    axis equal; 
    view(3);
    title('Maillage après segmentation'); 
end