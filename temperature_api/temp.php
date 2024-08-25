<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // เพิ่ม header นี้

$response = [
    "title" => "Temperature Conversion",
    "tempdata" => [
        "temperature" => null,
        "unit" => null,
        "Celsius" => null,
        "Fahrenheit" => null,
        "Réaumur" => null,
        "Kelvin" => null
    ]
];

if (isset($_GET['temperature']) && isset($_GET['unit'])) {
    $temperature = $_GET['temperature'];
    $unit = $_GET['unit'];
    
    $converted = convertTemperature($temperature, $unit);
    
    $response['tempdata'] = array_merge($response['tempdata'], [
        "temperature" => $temperature,
        "unit" => $unit
    ], $converted);
} // No else part needed as null values are default

echo json_encode($response);

function convertTemperature($temp, $unit) {
    $result = [];
    switch ($unit) {
        case 'Celsius':
            $result['Celsius'] = $temp;
            $result['Fahrenheit'] = $temp * 9 / 5 + 32;
            $result['Réaumur'] = $temp * 4 / 5;
            $result['Kelvin'] = $temp + 273.15;
            break;
        case 'Fahrenheit':
            $result['Celsius'] = ($temp - 32) * 5 / 9;
            $result['Fahrenheit'] = $temp;
            $result['Réaumur'] = ($temp - 32) * 4 / 9;
            $result['Kelvin'] = ($temp + 459.67) * 5 / 9;
            break;
        case 'Réaumur':
            $result['Celsius'] = $temp * 5 / 4;
            $result['Fahrenheit'] = $temp * 9 / 4 + 32;
            $result['Réaumur'] = $temp;
            $result['Kelvin'] = $temp * 5 / 4 + 273.15;
            break;
        case 'Kelvin':
            $result['Celsius'] = $temp - 273.15;
            $result['Fahrenheit'] = $temp * 9 / 5 - 459.67;
            $result['Réaumur'] = ($temp - 273.15) * 4 / 5;
            $result['Kelvin'] = $temp;
            break;
        default:
            return [
                'Celsius' => null,
                'Fahrenheit' => null,
                'Réaumur' => null,
                'Kelvin' => null
            ];
    }
    return $result;
}
?>
