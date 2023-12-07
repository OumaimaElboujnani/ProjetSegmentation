function visualizeNormals(vertices, faces, normals)
    figure; 
    patch('Vertices', vertices, 'Faces', faces, 'EdgeColor', 'k', 'FaceColor', 'none'); % Dessiner le maillage
    axis equal; 
    view(3); 
    title('Normales du maillage'); 
    hold on; 

    % Calculer le centre de chaque triangle
    triangleCenters = zeros(size(faces, 1), 3);
    for i = 1:size(faces, 1)
        v1 = vertices(faces(i, 1), :);
        v2 = vertices(faces(i, 2), :);
        v3 = vertices(faces(i, 3), :);
        triangleCenters(i, :) = mean([v1; v2; v3]);
    end

    % Dessiner les normales
    quiver3(triangleCenters(:, 1), triangleCenters(:, 2), triangleCenters(:, 3), ...
            normals(:, 1), normals(:, 2), normals(:, 3), 0.5, 'r'); % Ajouter les flèches représentant les normales
    
    hold off; 
end
