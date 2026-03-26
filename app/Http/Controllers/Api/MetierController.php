<?php

namespace App\Http\Controllers\Api;

use App\Data\MetierCatalog;
use App\Http\Controllers\Controller;
use Illuminate\Http\JsonResponse;

class MetierController extends Controller
{
    public function show(int $id): JsonResponse
    {
        $metier = MetierCatalog::find($id);

        if (! $metier) {
            return response()->json([
                'message' => 'Métier introuvable.',
            ], 404);
        }

        return response()->json([
            'data' => [
                'id' => $metier['id'],
                'slug' => $metier['slug'],
                'nom' => $metier['nom'],
                'description' => $metier['description'],
                'secteur' => $metier['secteur'],
                'niveau_etude' => $metier['niveau_etude'],
                'salaire' => [
                    'debut' => $metier['salaire_debut'],
                    'confirme' => $metier['salaire_confirme'],
                    'devise' => 'EUR',
                    'periode' => 'annuel',
                ],
            ],
        ]);
    }

    public function competences(int $id): JsonResponse
    {
        $metier = MetierCatalog::find($id);

        if (! $metier) {
            return response()->json([
                'message' => 'Métier introuvable.',
            ], 404);
        }

        return response()->json([
            'data' => [
                'metier_id' => $metier['id'],
                'metier_nom' => $metier['nom'],
                'competences' => $metier['competences'],
            ],
        ]);
    }

    public function parcours(int $id): JsonResponse
    {
        $metier = MetierCatalog::find($id);

        if (! $metier) {
            return response()->json([
                'message' => 'Métier introuvable.',
            ], 404);
        }

        return response()->json([
            'data' => [
                'metier_id' => $metier['id'],
                'metier_nom' => $metier['nom'],
                'parcours' => $metier['parcours'],
            ],
        ]);
    }

    public function ecoles(int $id): JsonResponse
    {
        $metier = MetierCatalog::find($id);

        if (! $metier) {
            return response()->json([
                'message' => 'Métier introuvable.',
            ], 404);
        }

        return response()->json([
            'data' => [
                'metier_id' => $metier['id'],
                'metier_nom' => $metier['nom'],
                'ecoles' => $metier['ecoles'],
            ],
        ]);
    }
}
