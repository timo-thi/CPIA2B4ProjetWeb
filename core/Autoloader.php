<?php
namespace Core;


/**
 * Autoloader
 */
class Autoloader {
	
	/**
	 * Register the autoloader
	 */
	static function register() {
		spl_autoload_register(array(__CLASS__, 'autoload'));
	}

	/**
	 * Autoload a class
	 */
	static function autoload($class) {
		if (strpos($class, __NAMESPACE__ . '\\') === 0) {
			$class = str_replace(__NAMESPACE__ . '\\', '', $class);
			$class = str_replace('\\', DIRECTORY_SEPARATOR, $class);
			require __DIR__ . DIRECTORY_SEPARATOR . $class . '.php';
		}
	}
}