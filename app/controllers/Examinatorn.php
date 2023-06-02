<?php

class Examinatorn extends BaseController
{
    private $examinatornModel;
    public function __construct()
    {
        $this->examinatornModel = $this->model('ExaminatornModel');
    }
    public function index()
    {

        $instructeurs = $this->examinatornModel->getexaminatorn();

        // var_dump($instructeurs);
        $aantalExaminatorn = sizeof($examinatorn);

        $tableRows = '';

        foreach ($examinatorn as $examinator) {
            $datum = date_create($examinator->DatumExamen);
            $datum = date_format($datum, 'd-m-Y');
            $tableRows .=  "<tr>
                                <td>$examinator->NaamExaminator</td>
                                <td>$datum</td>
                                <td>$examinator->Rijbewijscategorie</td>
                                <td>$examinator->Rijschool</td>
                                <td>$examinator->Stad</td>
                                <td>$examinator->UitslagExamen</td>

                                <td>
                                    <a href='" . URLROOT . "/Examinatoren/gebruikteVoertuigen/$examinator->Id'>
                                    <i class='bi bi-car-front'></i>
                                </td>
                            </tr>";
        }


        $data = [
            'title' => 'Overzicht Afgenomen Examnes Examinatoren',
            'tableRows' => $tableRows
        ];

        $this->view('Examinatorn/index', $data);
    }

    public function examinatorn($examinatornId)
    {
        // Ophalen van de gegevens over de instructeur met een apart query
        $examinatorn =   $this->ExaminatornModel->getExaminatornInfoById($examinatornId);
        // var_dump($instructeur);
        // Ophalen toegewezenb voertuigen van geselecteerde instructeur
        $assignedVehicles = $this->ExaminatornModel->getAssignedVehiclesToInstructor($examinatornId);
        // var_dump($assignedVehicles);

        $tableRows = "";

        foreach ($assignedVehicles as $vehicles) {
            $date = date_format(date_create($vehicles->Bouwjaar), 'd-m-Y');
            $tableRows .= "<tr?>
            <td>$vehicles->TypeVoertuig</td>
            <td>$vehicles->Type</td>
            <td>$vehicles->Kenteken</td>
            <td>$date</td>
            <td>$vehicles->Brandstof</td>
            <td>$vehicles->Rijbewijscategorie</td>

                           </tr>";
        }

        $data = [
            'title'         => 'Door instructeur gebruikte voertuigen',
            'voornaam'     => $instructeur->Voornaam,
            'tussenvoegsel'         => $instructeur->Tussenvoegsel,
            'achternaam' => $instructeur->Achternaam,
            'datumInDienst'          => $instructeur->DatumInDienst,
            'aantalSterren'        => $instructeur->AantalSterren,
            'tableRows' => $tableRows
        ];
        $this->view('Examinator/gebruikteVoertuigen', $data);
    }
}
