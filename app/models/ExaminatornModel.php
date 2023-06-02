<?php

class InstructeurModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $sql = "SELECT * 
                FROM instructeur 
                ORDER BY AantalSterren DESC ";

        $this->db->query($sql);

        return $this->db->resultSet();
    }


    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    // MENEER WERK
    public function getInstructeurInfoById($instructeurId)
    {
        $sql = "SELECT INST.Voornaam
                       ,INST.Tussenvoegsel
                       ,INST.Achternaam
                       ,INST.DatumInDienst
                       ,INST.AantalSterren
                FROM Instructeur as INST
                WHERE Id = $instructeurId";

        $this->db->query($sql);

        return   $this->db->single();
    }
    public function getAssignedVehiclesToInstructor($instructeurId)
    {
        $sql = "SELECT 
                       TYVO.TypeVoertuig
                       ,VOER.Type
                       ,VOER.Kenteken
                       ,VOER.Bouwjaar
                       ,VOER.Brandstof
                       ,TYVO.Rijbewijscategorie
                FROM VoertuigInstructeur as VOIN
                INNER JOIN Voertuig as VOER
                ON         VOER.Id = VOIN.VoertuigId

                INNER JOIN TypeVoertuig as TYVO
                ON         TYVO.Id = VOER.TypeVoertuigId
                WHERE VOIN.InstructeurId = $instructeurId
                ORDER BY TYVO.Rijbewijscategorie ASC";
        $this->db->query($sql);
        return   $this->db->resultSet();
    }
}
