<?php

use App\Http\Controllers\Api\MetierController;
use Illuminate\Support\Facades\Route;

// Endpoint de listing existant conservé ici à titre de rappel :
// Route::get('/metiers', [MetierController::class, 'index']);

Route::prefix('metiers')->group(function (): void {
    Route::get('{id}', [MetierController::class, 'show']);
    Route::get('{id}/competences', [MetierController::class, 'competences']);
    Route::get('{id}/parcours', [MetierController::class, 'parcours']);
    Route::get('{id}/ecoles', [MetierController::class, 'ecoles']);
});
