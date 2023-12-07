% Je vais essayer de minimiser l'utilisation des boucles for dans mon code
% et de me concentrer sur l'amélioration de sa complexité.
% J'ai aussi intégré toutes vos explications et suggestions de notre
% dernière seance.
clc; 
close all;
clear all;

% Paramètres
filename = 'sphere_poly12ascii.stl'; % Nom du fichier STL
angleThreshold = 10; % Seuil d'angle pour la segmentation
angleThresholdRad = deg2rad(angleThreshold); % Conversion de l'angle en radians
minGroupSize = 0; % Taille minimale pour un groupe

% Lecture du fichier STL
[vertices, faces] = readSTL(filename); 

% Calcul des normales pour chaque triangle
normals = computeNormals(vertices, faces);   

% Sélection des groupes de triangles
groups = selectTriangleGroups(vertices, faces, normals, angleThresholdRad);

% Combinaison des petits segments
groups = combineSmallGroups(groups, faces, normals, minGroupSize);

% Affichage du maillage avant segmentation
visualizeMesh(vertices, faces);

% Affichage du maillage après segmentation
visualizeSegmentedMesh(vertices, faces, groups);

% Visualisation des normales des triangles pour s'assurer que les normales
% ont le même sens
visualizeNormals(vertices, faces, normals);

% Affichage du maillage après segmentation utilisant des couleurs
% aleatoires pour mieux identifier les groupes
visualizeSegmentedMesh2(vertices, faces, groups);

% Calculer et afficher le nombre de triangles dans chaque groupe
%groupCounts = countTrianglesInGroups(groups);
