{ config, lib, pkgs, ... }:

{
	imports = [ 
		./hardware-configuration.nix
	];

	nixpkgs.config.allowUnfree = true;

	boot = {
		loader = {
			grub.enable = true;
			timeout = 0;
			grub.timeoutStyle = "hidden";
			efi.canTouchEfiVariables = true;
		};
		
		kernelParams = ["quiet" "amd_iommu=on" "iommu=pt"];

		initrd = {
			kernelModules = [
				"vfio_pci" "vfio" "vfio_iommu_type1"
				"nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"
			];

			systemd.enable = true;
		};

		extraModprobeConfig = "options kvm_intel nested=1";
	};

	hardware = {
		opengl.enable = true;
		pulseaudio.enable = false;
		nvidia = {
			modesetting.enable = true;
			open = false;
			package = config.boot.kernelPackages.nvidiaPackages.stable;
		};
	};

	networking.networkmanager.enable = true;
	time.timeZone = "Europe/Berlin";

	i18n = {
		defaultLocale = "en_US.UTF-8";
		supportedLocales = ["all"];
	};

	services = {
		xserver = {
			enable = true;
			displayManager.gdm.enable = true;
			desktopManager.gnome.enable = true;
			videoDrivers = ["nvidia"];
			layout = "us";
			xkbVariant = "workman-intl";
		};

		gnome.core-utilities.enable = false;
		libinput.enable = true;
		printing.enable = true;
		udev.packages = with pkgs; [gnome.gnome-settings-daemon];
		flatpak.enable = true;

		pipewire = {
			enable = true;
			pulse.enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
		};

		openssh.enable = true;
	};

	xdg.portal = {
		enable = true;
		config.common.default = "*";
		# extraPortals = [xdg-desktop-portal-gtk];
		# gnome.enable = true;
		# config.default = ["gtk"];
	};

	programs = {
		dconf.enable = true;
		virt-manager.enable = true;
	};

	virtualisation = {
		libvirtd = {
			enable = true;
			qemu = {
				swtpm.enable = true;
				ovmf.enable = true;
				ovmf.packages = [ pkgs.OVMFFull.fd ];
			};
		};

		spiceUSBRedirection.enable = true;
	};

	environment.etc = {
		"ovmf/edk2-x86_64-secure-code.fd" = {
			 source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
		};
	};

	users.users = {
		max = {
			isNormalUser = true;
			extraGroups = [ "wheel" "sudo" "kvm" "libvirtd" ];
			packages = with pkgs; [
				 flatpak
				 gnome.gnome-terminal
				 gnome.nautilus
				 gnome.file-roller
				 gnome.gnome-system-monitor
				 gnome.gnome-calculator
				 gnome.gnome-calendar
				 gnome.gnome-tweaks
			];
		};
	};


	environment.systemPackages = with pkgs;[
		vim
		tmux
		gnome.gdm
		gnome.gnome-shell
		libvirt
		virt-manager
		qemu_full
		OVMFFull
		OVMF
		spice-gtk
		whitesur-cursors
		fluent-icon-theme
		adw-gtk3
		gnome.gnome-themes-extra
		libdecor
		xdg-desktop-portal
		xdg-desktop-portal-gtk
		xdg-desktop-portal-gnome
		swtpm
		libvirt-glib
		dnsmasq
		virtiofsd
		looking-glass-client
	];

	system.stateVersion = "unstable";
}
