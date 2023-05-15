<?php

header('Access-Control-Allow-Methods: GET');

abstract class HTTPCodes {
  const OK = 200;
  const RECORD_CREATED = 201;
  const NO_CONTENT = 204;
  const BAD_REQUEST = 400;
  const METHOD_NOT_ALLOWED = 405;
  const INTERNAL_SERVER_ERROR = 500;
}

class Api {
  public function __construct(string $host, string $user, string $password, string $db_name)
  {
    $this->conn = new mysqli($host, $user, $password, $db_name);
    if ($this->conn->connect_error) {
      $this->set_http_response_code(HTTPCodes::INTERNAL_SERVER_ERROR);
    }
  }

  public function set_http_response_code(int $http_code)
  {
    http_response_code($http_code);
  }

  public function handle_request()
  {
    switch ($_SERVER['REQUEST_METHOD']) {
      case 'GET':
        $this->handle_get();
        break;
      default:
        $this->set_http_response_code(HTTPCodes::METHOD_NOT_ALLOWED);
    }
  }

  public function handle_get()
  {
    if (isset($_GET['option'])) {
      $option = $_GET['option'];
      $option = mysqli_real_escape_string($this->conn, $option);
    } else {
      $this->set_http_response_code(HTTPCodes::BAD_REQUEST);
    }

    switch ($option) {
      case 'cb_tag':
        $this->handle_cb_tag();
        break;
      default:
        $this->set_http_response_code(HTTPCodes::BAD_REQUEST);
    }
  }

  public function handle_cb_tag()
  {
    if(isset($_GET['tags'])) {
      $tags = $_GET['tags'];
      $tags = mysqli_real_escape_string($this->conn, $tags);
    }

    $tags = '%' . implode('%', explode(',', $tags)) . '%';
    $stmt = $this->conn->prepare("SELECT * FROM games WHERE game_tags LIKE ?");
    $stmt->bind_param("s", $tags);
    $stmt->execute();

    $result = $stmt->get_result();
    $this->validate_get_response($result);
  }

  public function validate_get_response($result)
  {
    if (mysqli_num_rows($result) != 0) {
      $game = array();
      while ($row = $result->fetch_assoc()) {
        $game[] = array('id' => (int)$row['ID'], 'title' => $row['game_title'], 'price' => $row['game_price'], 'desc' => $row['game_desc'], 'tags' => $row['game_tags'], 'sales' => $row['game_sales'], 'release date' => $row['release_date']);
      }
      $this->output_get($game);
    } else {
      $this->set_http_response_code(HTTPCodes::NO_CONTENT);
    }
  }

  public function output_get(array $game)
  {
    $this->set_http_response_code(HTTPCodes::OK);
    header('Content-Type: application/json; charset=UTF-8');
    echo '{"results":'.json_encode($game, JSON_PRETTY_PRINT).'}';
    return $game;
  }
}

$api = new Api("localhost", "root", "", "cbtest");
$api->handle_request();