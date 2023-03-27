<?php
namespace Core\Table;


use Core\Database\Database;
use \App;


class Table {


	/** @var string - name of the table in the database
	 */
	protected $table;
	/** @var mixed(Database, MysqlDatabase) || Toute classe de database qui hérite de Database
	 */
	protected $db;


	/** Table constructor.
	 * @param Database $db
	 */
	public function __construct(Database $db){
		$this->db = $db;
		if (is_null($this->table)) {
			$parts = explode('\\', get_class($this));
			$class_name = end($parts);
			$this->table = strtolower(str_replace('Table', '', $class_name)) . 's';
		}
	}


	/** Extract values ($value) of column ($key) from records
	 * @param $key string - key in the extracted array
	 * @param $value string - value to be extracted from records
	 * @return array
	 */
	public function extract($key) {
		$records = $this->all();
		$return = [];
		foreach ($records as $v) {
			$return[] = $v->$key;
		}
		return $return;
	}


	/** Query the database
	 * @param $statement string - SQL statement
	 * @param $attributes array - attributes to be binded to the statement
	 * @param $one boolean - if true, return only one record
	 * @return mixed
	 */
	public function query($statement, $attributes, $one = false) : mixed {
		if ($attributes) {
			return $this->db->prepare(
				$statement,
				$attributes,
				str_replace('Table', 'Entity', get_class($this)),
				$one
			);
		} else {
			return $this->db->query(
				$statement,
				str_replace('Table', 'Entity', get_class($this)),
				$one
			);
		}
	}


	/** Get all records from a table
	 * @return array
	 */
	public function all() {
		$proc_name = "call SELECT_" . strtoupper($this->table) . "();"; // SEARCH in any table in database and get all records
		return $this->query($proc_name, null);
	}


	/** Get one record from a table where id is $id
	 * @return Entity or child of Entity
	 */
	public function search() {
		$proc_name = "call SEARCH_" . strtoupper($this->table) . "()"; // SEARCH one record in table
		return $this->query($proc_name, null);
	}


	/** Get one record from a table
	 * @param $id int - id of the record to be fetched
	 * @return array
	 */
	public function find($id) {
		$upper_table = strtoupper($this->table);
		return $this->query(
			"call FIND_{$upper_table}(?)",
			[$id],
			false
		);
	}


	public function details($id) {
		$upper_table = strtoupper($this->table);
		return $this->query(
			"call DETAILS_{$upper_table}(?)",
			[$id],
			false
		);
	}


	/** Update a record in a table
	 * @param $id int - id of the record to be updated
	 * @param $fields array - fields to be updated (format : ['field_name' => 'field_value'])
	 * @return array
	 */
	public function update($id, $fields) {
		$sql_parts = [];
		$attributes = [];
		foreach ($fields as $k => $v) {
			$sql_parts[] = "$k = ?";
			$attributes[] = $v;
		}
		$attributes[] = $id;
		$sql_part = implode(', ', $sql_parts);
		return $this->query(
			"UPDATE {$this->table} SET $sql_part WHERE id = ?",
			$attributes,
			true
		);
	}


	/** Delete a record from a table
	 * @param $id int - id of the record to be deleted
	 * @return array
	 */
	public function delete($id) {
		return $this->query(
			"DELETE_{$this->table}(?)",
			[$id],
			true
		);
	}
}