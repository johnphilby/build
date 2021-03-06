OPTEE_OS_VERSION = 1.0
OPTEE_OS_SOURCE = local
OPTEE_OS_SITE = $(BR2_PACKAGE_OPTEE_OS_SITE)
OPTEE_OS_SITE_METHOD = local
OPTEE_OS_SDK = $(BR2_PACKAGE_OPTEE_OS_SDK)

define OPTEE_OS_INSTALL_OPTEE_OS_SHLIBS
	@mkdir -p $(TARGET_DIR)/lib/optee_armtz && \
		for f in $(OPTEE_OS_SDK)/lib/*.ta; do \
			[ -f "$f" ] || continue; \
			$(INSTALL) -v -p  --mode=444 \
				--target-directory=$(TARGET_DIR)/lib/optee_armtz $$f; \
		done
endef

OPTEE_OS_POST_INSTALL_TARGET_HOOKS += OPTEE_OS_INSTALL_OPTEE_OS_SHLIBS

$(eval $(cmake-package))
