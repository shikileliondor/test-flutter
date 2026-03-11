<?php

namespace App\Data;

class MetierCatalog
{
    /**
     * @return array<int, array<string, mixed>>
     */
    public static function all(): array
    {
        return [
            1 => [
                'id' => 1,
                'slug' => 'developpeur-mobile',
                'nom' => 'Développeur mobile',
                'description' => 'Conçoit et maintient des applications mobiles performantes.',
                'secteur' => 'Numérique',
                'niveau_etude' => 'Bac+3 à Bac+5',
                'salaire_debut' => 28000,
                'salaire_confirme' => 42000,
                'competences' => [
                    'Dart et Flutter',
                    'Architecture logicielle',
                    'Tests unitaires et d’intégration',
                    'Intégration d’API REST',
                ],
                'parcours' => [
                    [
                        'niveau' => 'Bac',
                        'intitule' => 'Bac général spécialité NSI',
                    ],
                    [
                        'niveau' => 'Bac+2',
                        'intitule' => 'BTS SIO option SLAM',
                    ],
                    [
                        'niveau' => 'Bac+3',
                        'intitule' => 'Licence professionnelle développement mobile',
                    ],
                ],
                'ecoles' => [
                    [
                        'id' => 101,
                        'nom' => 'École Supérieure du Numérique',
                        'ville' => 'Lyon',
                        'formation' => 'Bachelor Développement mobile',
                    ],
                    [
                        'id' => 102,
                        'nom' => 'Institut Tech Paris',
                        'ville' => 'Paris',
                        'formation' => 'Mastère Ingénierie mobile',
                    ],
                ],
            ],
            2 => [
                'id' => 2,
                'slug' => 'data-analyst',
                'nom' => 'Data Analyst',
                'description' => 'Analyse des données pour faciliter la prise de décision.',
                'secteur' => 'Data',
                'niveau_etude' => 'Bac+3 à Bac+5',
                'salaire_debut' => 30000,
                'salaire_confirme' => 45000,
                'competences' => [
                    'SQL',
                    'Visualisation de données',
                    'Python',
                    'Statistiques',
                ],
                'parcours' => [
                    [
                        'niveau' => 'Bac',
                        'intitule' => 'Bac général spécialités maths et NSI',
                    ],
                    [
                        'niveau' => 'Bac+3',
                        'intitule' => 'Licence MIASHS',
                    ],
                    [
                        'niveau' => 'Bac+5',
                        'intitule' => 'Master Data Science',
                    ],
                ],
                'ecoles' => [
                    [
                        'id' => 201,
                        'nom' => 'Data School Bordeaux',
                        'ville' => 'Bordeaux',
                        'formation' => 'Master Analyste de données',
                    ],
                ],
            ],
        ];
    }

    /**
     * @return array<string, mixed>|null
     */
    public static function find(int $id): ?array
    {
        return self::all()[$id] ?? null;
    }
}
