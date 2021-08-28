CREATE TABLE `task_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task_groups_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed_at` date DEFAULT NULL,
  `task_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_tasks_groups_task_group_id_FK` (`task_group_id`),
  CONSTRAINT `tasks_tasks_groups_task_group_id_FK` FOREIGN KEY (`task_group_id`) REFERENCES `task_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tasks_depending_tasks` (
  `task_id` int(11) NOT NULL,
  `depending_task_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`,`depending_task_id`),
  KEY `tasks_depending_tasks_depending_task_id_FK` (`depending_task_id`),
  CONSTRAINT `tasks_depending_tasks_depending_task_id_FK` FOREIGN KEY (`depending_task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `tasks_depending_tasks_task_id_FK` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
