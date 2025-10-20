
class LocationData {
  static final List<String> countries = [
    'Colombia',
    'México',
    'Argentina',
    'España',
    'Estados Unidos',
  ];

  static final Map<String, List<String>> departments = {
    // Colombia
    'Colombia': [
      'Norte de Santander',
      'Antioquia',
      'Valle del Cauca',
      'Cundinamarca',
      'Atlántico',
      'Santander',
      'Bolívar',
      'Bogotá D.C.',
    ],

    // México
    'México': [
      'Ciudad de México',
      'Jalisco',
      'Nuevo León',
      'Puebla',
      'Guanajuato',
      'Chiapas',
      'Veracruz',
      'Estado de México',
    ],

    // Argentina
    'Argentina': [
      'Buenos Aires',
      'Córdoba',
      'Santa Fe',
      'Mendoza',
      'Tucumán',
      'Salta',
      'Entre Ríos',
      'Chaco',
    ],

    // España
    'España': [
      'Madrid',
      'Cataluña',
      'Andalucía',
      'Valencia',
      'Galicia',
      'Castilla y León',
      'País Vasco',
      'Castilla-La Mancha',
    ],

    // Estados Unidos
    'Estados Unidos': [
      'California',
      'Texas',
      'Florida',
      'Nueva York',
      'Illinois',
      'Pensilvania',
      'Ohio',
      'Georgia',
    ],
  };

  static final Map<String, List<String>> cities = {
    // Colombia
    'Norte de Santander': [
      'Cúcuta',
      'Pamplona',
      'Ocaña',
      'Villa del Rosario',
      'Los Patios',
    ],
    'Antioquia': [
      'Medellín',
      'Envigado',
      'Bello',
      'Itagüí',
      'Sabaneta',
      'Rionegro',
    ],
    'Valle del Cauca': ['Cali', 'Palmira', 'Buenaventura', 'Tuluá', 'Cartago'],
    'Cundinamarca': [
      'Soacha',
      'Facatativá',
      'Zipaquirá',
      'Chía',
      'Mosquera',
      'Fusagasugá',
    ],
    'Atlántico': [
      'Barranquilla',
      'Soledad',
      'Malambo',
      'Puerto Colombia',
      'Sabanalarga',
    ],
    'Santander': [
      'Bucaramanga',
      'Floridablanga',
      'Girón',
      'Piedecuesta',
      'Barrancabermeja',
    ],
    'Bolívar': [
      'Cartagena',
      'Magangué',
      'Turbaco',
      'Arjona',
      'El Carmen de Bolívar',
    ],
    'Bogotá D.C.': ['Bogotá'],

    // México
    'Ciudad de México': [
      'Benito Juárez',
      'Miguel Hidalgo',
      'Coyoacán',
      'Cuauhtémoc',
      'Álvaro Obregón',
    ],
    'Jalisco': [
      'Guadalajara',
      'Zapopan',
      'Tlaquepaque',
      'Tonalá',
      'Puerto Vallarta',
    ],
    'Nuevo León': [
      'Monterrey',
      'Guadalupe',
      'San Nicolás de los Garza',
      'Apodaca',
      'San Pedro Garza García',
    ],
    'Puebla': [
      'Puebla',
      'Tehuacán',
      'San Martín Texmelucan',
      'Atlixco',
      'Cholula',
    ],
    'Guanajuato': ['León', 'Irapuato', 'Celaya', 'Salamanca', 'Guanajuato'],
    'Chiapas': [
      'Tuxtla Gutiérrez',
      'Tapachula',
      'San Cristóbal de las Casas',
      'Comitán',
      'Palenque',
    ],
    'Veracruz': ['Veracruz', 'Xalapa', 'Coatzacoalcos', 'Córdoba', 'Poza Rica'],
    'Estado de México': [
      'Ecatepec',
      'Naucalpan',
      'Tlalnepantla',
      'Nezahualcóyotl',
      'Toluca',
    ],

    // Argentina
    'Buenos Aires': [
      'La Plata',
      'Mar del Plata',
      'Bahía Blanca',
      'Quilmes',
      'Avellaneda',
    ],
    'Córdoba': [
      'Córdoba',
      'Villa María',
      'Río Cuarto',
      'Carlos Paz',
      'Bell Ville',
    ],
    'Santa Fe': [
      'Rosario',
      'Santa Fe',
      'Rafaela',
      'Venado Tuerto',
      'Reconquista',
    ],
    'Mendoza': [
      'Mendoza',
      'Godoy Cruz',
      'Guaymallén',
      'Las Heras',
      'San Rafael',
    ],
    'Tucumán': [
      'San Miguel de Tucumán',
      'Yerba Buena',
      'Tafí Viejo',
      'Concepción',
      'Aguilares',
    ],
    'Salta': [
      'Salta',
      'San Ramón de la Nueva Orán',
      'Tartagal',
      'Metán',
      'Cafayate',
    ],
    'Entre Ríos': [
      'Paraná',
      'Concordia',
      'Gualeguaychú',
      'Concepción del Uruguay',
      'Victoria',
    ],
    'Chaco': [
      'Resistencia',
      'Presidencia Roque Sáenz Peña',
      'Villa Ángela',
      'Barranqueras',
      'Charata',
    ],

    // España
    'Madrid': [
      'Madrid',
      'Móstoles',
      'Fuenlabrada',
      'Alcalá de Henares',
      'Getafe',
    ],
    'Cataluña': [
      'Barcelona',
      'Hospitalet de Llobregat',
      'Badalona',
      'Terrassa',
      'Sabadell',
    ],
    'Andalucía': [
      'Sevilla',
      'Málaga',
      'Córdoba',
      'Granada',
      'Jerez de la Frontera',
    ],
    'Valencia': [
      'Valencia',
      'Alicante',
      'Elche',
      'Castellón de la Plana',
      'Torrent',
    ],
    'Galicia': [
      'Vigo',
      'A Coruña',
      'Ourense',
      'Lugo',
      'Santiago de Compostela',
    ],
    'Castilla y León': [
      'Valladolid',
      'Burgos',
      'Salamanca',
      'León',
      'Palencia',
    ],
    'País Vasco': [
      'Bilbao',
      'Vitoria-Gasteiz',
      'San Sebastián',
      'Barakaldo',
      'Getxo',
    ],
    'Castilla-La Mancha': [
      'Albacete',
      'Toledo',
      'Guadalajara',
      'Ciudad Real',
      'Talavera de la Reina',
    ],

    // Estados Unidos
    'California': [
      'Los Angeles',
      'San Francisco',
      'San Diego',
      'San Jose',
      'Sacramento',
    ],
    'Texas': ['Houston', 'Dallas', 'Austin', 'San Antonio', 'Fort Worth'],
    'Florida': ['Miami', 'Orlando', 'Tampa', 'Jacksonville', 'Fort Lauderdale'],
    'Nueva York': [
      'New York City',
      'Buffalo',
      'Rochester',
      'Albany',
      'Syracuse',
    ],
    'Illinois': ['Chicago', 'Aurora', 'Naperville', 'Joliet', 'Rockford'],
    'Pensilvania': ['Filadelfia', 'Pittsburgh', 'Allentown', 'Erie', 'Reading'],
    'Ohio': ['Columbus', 'Cleveland', 'Cincinnati', 'Toledo', 'Akron'],
    'Georgia': ['Atlanta', 'Augusta', 'Columbus', 'Savannah', 'Athens'],
  };
}
