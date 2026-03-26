<?php

namespace Tests\Feature;

use Tests\TestCase;

class MetierApiTest extends TestCase
{
    public function test_show_metier_returns_structured_json(): void
    {
        $response = $this->getJson('/api/metiers/1');

        $response
            ->assertOk()
            ->assertJsonStructure([
                'data' => [
                    'id',
                    'slug',
                    'nom',
                    'description',
                    'secteur',
                    'niveau_etude',
                    'salaire' => ['debut', 'confirme', 'devise', 'periode'],
                ],
            ]);
    }

    public function test_metier_related_resources_endpoints_return_data(): void
    {
        $this->getJson('/api/metiers/1/competences')
            ->assertOk()
            ->assertJsonStructure(['data' => ['metier_id', 'metier_nom', 'competences']]);

        $this->getJson('/api/metiers/1/parcours')
            ->assertOk()
            ->assertJsonStructure(['data' => ['metier_id', 'metier_nom', 'parcours']]);

        $this->getJson('/api/metiers/1/ecoles')
            ->assertOk()
            ->assertJsonStructure(['data' => ['metier_id', 'metier_nom', 'ecoles']]);
    }

    public function test_returns_404_for_unknown_metier(): void
    {
        $this->getJson('/api/metiers/999')
            ->assertNotFound()
            ->assertJson([
                'message' => 'Métier introuvable.',
            ]);
    }
}
