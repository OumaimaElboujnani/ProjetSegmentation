function normals = computeNormals(vertices, faces)
    normals = zeros(size(faces, 1), 3); % Initialiser le tableau des normales
    for i = 1:size(faces, 1) % Parcourir toutes les faces
        % Extraire les sommets du triangle
        v1 = vertices(faces(i, 1), :);
        v2 = vertices(faces(i, 2), :);
        v3 = vertices(faces(i, 3), :);

        % Calculer le vecteur normal pour le triangle
        edge1 = v2 - v1;
        edge2 = v3 - v1;
        normal = cross(edge1, edge2); % Produit vectoriel pour la normale

        % Normalisation du vecteur normal
        normals(i, :) = normal / norm(normal);
    end
end

%Pour chaque triangle, elle sélectionne trois sommets (v1, v2, v3).
%Elle calcule la normale du triangle en utilisant le produit vectoriel (cross(v2-v1, v3-v1)). Ce calcul dépend de l'ordre des sommets.
%Enfin, elle normalise la normale, de sorte que sa longueur soit égale à 1.

% La direction de chaque normale calculée dépend de l'ordre des sommets utilisés dans le produit vectoriel.
% Pour un maillage bien formé, comme ceux généralement issus des fichiers STL, les triangles sont orientés de manière cohérente.
% Cela signifie que si les triangles sont orientés systématiquement dans le sens horaire ou anti-horaire, les normales calculées seront également cohérentes et pointent dans la même direction générale.
% Ce comportement est crucial pour assurer que les comparaisons entre les normales des différents triangles soient fiables lors de processus tels que la segmentation.